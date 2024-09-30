package Repositories.Entities;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class StoryEntity {
    private int id;
    private Date postDate;
    private String facilityId;
    private String facilityName;
    private String customerId;
    private String customerName;
    private int customerStatus;
    private String title;
    private String description;

    public StoryEntity(ResultSet rs) throws SQLException {
        this.id = rs.getInt("Id");
        this.postDate = rs.getDate("PostDate");
        this.facilityId = rs.getString("FacilityId");
        this.facilityName = rs.getString("FacilityName");
        this.customerId = rs.getString("CustomerId");
        this.customerName = rs.getString("CustomerName");
        this.customerStatus = rs.getInt("CustomerStatus");
        this.title = rs.getString("Title");
        this.description = rs.getString("Description");
    }

    // Getter methods
    public int getId() {
        return id;
    }

    public Date getPostDate() {
        return postDate;
    }

    public String getFacilityId() {
        return facilityId;
    }

    public String getFacilityName() {
        return facilityName;
    }

    public String getCustomerId() {
        return customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public int getCustomerStatus() {
        return customerStatus;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    // Setter methods (if needed)

    // Other methods
}
