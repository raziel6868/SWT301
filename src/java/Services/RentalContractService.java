package Services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Domain.DTOs.BookingDto.CreateRentalContractDto;
import Domain.DTOs.PageDto.PageDto;
import Domain.DTOs.PageDto.PageMetaDto;
import Domain.DTOs.PageDto.PageQueryDto;
import Domain.Enums.Order;
import Domain.Models.RentalContract;
import Repositories.Common.RepositoryBase;
import Repositories.Entities.RentalContractEntity;

public class RentalContractService extends RepositoryBase<RentalContractEntity> {
    private BookingService bookingService;

    @Override
    protected String getTableName() {
        return "RentalContracts";
    }

    @Override
    protected RentalContractEntity createEntityFromResultSet(ResultSet rs) throws SQLException {
        return new RentalContractEntity(rs);
    }

    public RentalContractService() {
        bookingService = new BookingService();
    }

    public PageDto<RentalContract> getAllRentalContracts(PageQueryDto dto) {
        List<RentalContract> rentalContracts = new ArrayList<>();
        List<RentalContractEntity> entities = super.getAllWithOffset(dto.getOffset(), dto.getPageSize(),
                dto.getOrder() == Order.ASC);
        int itemCount = super.getTotalCount();

        for (RentalContractEntity entity : entities) {
            rentalContracts.add(mapEntityToRentalContract(entity));
        }

        PageMetaDto meta = new PageMetaDto(dto, itemCount);

        return new PageDto<>(rentalContracts, meta);
    }

    public PageDto<RentalContract> getRentalContractsOfCustomers(PageQueryDto dto, String customerId) {
        List<RentalContract> rentalContracts = new ArrayList<>();
        List<RentalContractEntity> entities = super.getAllWithOffset(String.format("CustomerId = '%s'", customerId),
                dto.getOffset(), dto.getPageSize(),
                dto.getOrder() == Order.ASC);
        int itemCount = super.getTotalCount(String.format("CustomerId = '%s'", customerId));

        for (RentalContractEntity entity : entities) {
            rentalContracts.add(mapEntityToRentalContract(entity));
        }

        PageMetaDto meta = new PageMetaDto(dto, itemCount);

        return new PageDto<>(rentalContracts, meta);
    }

    public RentalContract getRentalContractById(String id) {
        RentalContractEntity entity = super.getById(id);
        RentalContract rentalContract = mapEntityToRentalContract(entity);

        rentalContract.setBookings(bookingService.getBookingsOfContract(rentalContract.getId()));

        return rentalContract;
    }

    public void createRentalContract(CreateRentalContractDto dto, String customerId) {
        String query = String.format(
                "INSERT INTO %s (CustomerId,Deposit,TotalAmount) OUTPUT INSERTED.Id VALUES (?,?,?);",
                getTableName());

        List<Object> params = new ArrayList<>();
        params.add(customerId);
        params.add(dto.getDeposit());
        params.add(dto.getTotalAmount());

        int contractId = super.executeNonQueryReturnsId(query, params);

        query = String.format("UPDATE Bookings SET ContractId = %d WHERE Id IN (%s);", contractId, dto.getBookingIds());

        super.executeNonQuery(query, new ArrayList<>());
    }

    private RentalContract mapEntityToRentalContract(RentalContractEntity entity) {
        RentalContract rentalContract = new RentalContract();
        rentalContract.setId(entity.getId());
        rentalContract.setCustomerId(entity.getCustomerId());
        rentalContract.setDeposit(entity.getDeposit());
        rentalContract.setTotalAmount(entity.getTotalAmount());

        return rentalContract;
    }
}
