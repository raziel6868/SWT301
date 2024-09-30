package Domain.Models;

public class MaintenanceFacility {
    private String id;
    private String name;
    private int usageCount;

    public MaintenanceFacility() {

    }

    // Getter methods
    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getUsageCount() {
        return usageCount;
    }

    // Setter methods
    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setUsageCount(int usageCount) {
        this.usageCount = usageCount;
    }
}
