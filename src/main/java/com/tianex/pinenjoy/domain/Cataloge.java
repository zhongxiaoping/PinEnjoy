package com.tianex.pinenjoy.domain;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "fixedRegion")
@Table(name = "t_cataloge")
public class Cataloge implements Serializable {
    private static final long serialVersionUID = -7390094903896216971L;

    private String catalogeId;
    private String catalogeName;
    private String catalogeThumb;
    private String catalogeDescription;

    public Cataloge() {
    }

    public Cataloge(String catalogeId, String catalogeName, String catalogeDescription, String catalogeThumb) {
        this.catalogeId = catalogeId;
        this.catalogeName = catalogeName;
        this.catalogeDescription = catalogeDescription;
        this.catalogeThumb = catalogeThumb;
    }

    @Id
    @Column(name = "cataloge_id")
    public String getCatalogeId() {
        return catalogeId;
    }

    public void setCatalogeId(String catalogeId) {
        this.catalogeId = catalogeId;
    }

    @Column(name = "cataloge_name")
    public String getCatalogeName() {
        return catalogeName;
    }

    public void setCatalogeName(String catalogeName) {
        this.catalogeName = catalogeName;
    }

    @Column(name = "cataloge_thumb")
    public String getCatalogeThumb() {
        return catalogeThumb;
    }

    public void setCatalogeThumb(String catalogeThumb) {
        this.catalogeThumb = catalogeThumb;
    }

    @Column(name = "cataloge_description")
    public String getCatalogeDescription() {
        return catalogeDescription;
    }

    public void setCatalogeDescription(String catalogeDescription) {
        this.catalogeDescription = catalogeDescription;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Cataloge cataloge = (Cataloge) o;

        return !(catalogeId != null ? !catalogeId.equals(cataloge.catalogeId) : cataloge.catalogeId != null);

    }

    @Override
    public int hashCode() {
        return catalogeId != null ? catalogeId.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "Cataloge{" +
                "catalogeId='" + catalogeId + '\'' +
                ", catalogeName='" + catalogeName + '\'' +
                ", catalogeThumb='" + catalogeThumb + '\'' +
                ", catalogeDescription='" + catalogeDescription + '\'' +
                '}';
    }

}
