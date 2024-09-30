package Domain.DTOs.StoryDto;

import java.util.Date;

import Domain.Enums.CustomerStatus;
import Utils.ConvertUtils;

import jakarta.servlet.http.HttpServletRequest;

import java.util.Date;

public class CreateStoryDto {
    private Date postDate;
    private CustomerStatus customerStatus;
    private String title;
    private String description;

    public CreateStoryDto(HttpServletRequest request) {
        postDate = ConvertUtils.convertStringToDate(request.getParameter("PostDate"));
        customerStatus = CustomerStatus.fromIndex(ConvertUtils.convertStringToInt(request.getParameter("CustomerStatus")));
        title = request.getParameter("Title");
        description = request.getParameter("Description");
    }

    // Getters
    public Date getPostDate() {
        return postDate;
    }

    public CustomerStatus getCustomerStatus() {
        return customerStatus;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    // Setters
    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public void setCustomerStatus(CustomerStatus customerStatus) {
        this.customerStatus = customerStatus;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

