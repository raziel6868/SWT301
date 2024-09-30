package Services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Domain.DTOs.StoryDto.CreateStoryDto;
import Domain.DTOs.PageDto.PageDto;
import Domain.DTOs.PageDto.PageMetaDto;
import Domain.DTOs.PageDto.PageQueryDto;
import Domain.Enums.CustomerStatus;
import Domain.Enums.Order;
import Domain.Models.Customer;
import Domain.Models.Facility;
import Domain.Models.Story;
import Repositories.Common.RepositoryBase;
import Repositories.Entities.StoryEntity;

public class StoryService extends RepositoryBase<StoryEntity> {

    private CustomerService customerService;
    private FacilityService facilityService;

    @Override
    protected String getTableName() {
        return "Stories";
    }

    @Override
    protected StoryEntity createEntityFromResultSet(ResultSet rs) throws SQLException {
        return new StoryEntity(rs);
    }

    public StoryService() {
        customerService = new CustomerService();
        facilityService = new FacilityService();
    }

    public PageDto<Story> getAllStories(PageQueryDto dto) {
        List<Story> stories = new ArrayList<>();
        List<StoryEntity> entities = super.getAllWithOffset(dto.getOffset(), dto.getPageSize(),
                dto.getOrder() == Order.ASC);
        int itemCount = super.getTotalCount();

        for (StoryEntity entity : entities) {
            stories.add(mapEntityToStory(entity));
        }

        PageMetaDto meta = new PageMetaDto(dto, itemCount);

        return new PageDto<>(stories, meta);
    }

    public PageDto<Story> getStoriesByYearAndMonth(PageQueryDto dto, int year, int month) {
        List<Story> stories = new ArrayList<>();

        List<StoryEntity> entities = super.getAllWithOffset(
                String.format("YEAR(PostDate) = %d AND MONTH(PostDate) = %d", year, month),
                dto.getOffset(), dto.getPageSize(),
                dto.getOrder() == Order.ASC);
        int itemCount = super.getTotalCount(String.format("YEAR(PostDate) = %d AND MONTH(PostDate) = %d", year, month));

        for (StoryEntity entity : entities) {
            stories.add(mapEntityToStory(entity));
        }

        PageMetaDto meta = new PageMetaDto(dto, itemCount);

        return new PageDto<>(stories, meta);
    }

    public Story getStoryById(int id) {
        StoryEntity entity = super.getById(id);

        return mapEntityToStory(entity);
    }

    public void createStory(CreateStoryDto dto, String customerId, String facilityId) {
        String query = String.format(
                "INSERT INTO %s (PostDate,FacilityId,FacilityName,CustomerId,CustomerName,CustomerStatus,Title,Description) VALUES (?,?,?,?,?,?,?,?);",
                getTableName());

        Customer customer = customerService.getCustomerById(customerId);
        Facility facility = facilityService.getFacilityById(facilityId);

        List<Object> params = new ArrayList<>();
        params.add(dto.getPostDate());
        params.add(facility.getId());
        params.add(facility.getName());
        params.add(customer.getId());
        params.add(customer.getFullName());
        params.add(dto.getCustomerStatus().getIndex());
        params.add(dto.getTitle());
        params.add(dto.getDescription());

        super.executeNonQuery(query, params);
    }

    private Story mapEntityToStory(StoryEntity entity) {
        Story story = new Story();
        story.setId(entity.getId());
        story.setPostDate(entity.getPostDate());
        story.setFacilityId(entity.getFacilityId());
        story.setFacilityName(entity.getFacilityName());
        story.setCustomerId(entity.getCustomerId());
        story.setCustomerName(entity.getCustomerName());
        story.setCustomerStatus(CustomerStatus.fromIndex(entity.getCustomerStatus()));
        story.setTitle(entity.getTitle());
        story.setDescription(entity.getDescription());

        return story;
    }
}
