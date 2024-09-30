package Domain.DTOs.PageDto;

public class PageMetaDto {
    private int page;
    private int pageSize;
    private int itemCount;
    private int pageCount;
    private boolean hasPreviousPage;
    private boolean hasNextPage;

    public PageMetaDto(PageQueryDto pageQueryDto, int itemCount) {
        this.page = pageQueryDto.getPage();
        this.pageSize = pageQueryDto.getPageSize();
        this.itemCount = itemCount;
        this.pageCount = itemCount % pageSize == 0 ? itemCount / pageSize : itemCount / pageSize + 1;
        this.hasPreviousPage = this.page > 1;
        this.hasNextPage = this.page < this.pageCount;
    }

    public int getPage() {
        return page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public int getItemCount() {
        return itemCount;
    }

    public int getPageCount() {
        return pageCount;
    }

    public boolean hasPreviousPage() {
        return hasPreviousPage;
    }

    public boolean hasNextPage() {
        return hasNextPage;
    }
}
