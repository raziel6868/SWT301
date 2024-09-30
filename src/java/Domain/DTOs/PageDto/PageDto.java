package Domain.DTOs.PageDto;

import java.util.List;

public class PageDto<T> {
    private List<T> data;
    private PageMetaDto meta;

    public PageDto(List<T> data, PageMetaDto meta) {
        this.data = data;
        this.meta = meta;
    }

    public List<T> getData() {
        return data;
    }

    public PageMetaDto getMeta() {
        return meta;
    }
}
