package com.tianex.pinenjoy.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "t_cataloge")
public class Cataloge implements Serializable {
    private static final long serialVersionUID = -7390094903896216971L;

    private String catalogeId;
    private String catalogeName;

    public Cataloge() {
    }

    public Cataloge(String catalogeName) {
        this.catalogeName = catalogeName;
    }

    @Column(name = "cataloge_name")
    public String getCatalogeName() {
        return catalogeName;
    }

    public void setCatalogeName(String catalogeName) {
        this.catalogeName = catalogeName;
    }

    @Id
    @Column(name = "cataloge_id")
    public String getCatalogeId() {
        return catalogeId;
    }

    public void setCatalogeId(String catalogeId) {
        this.catalogeId = catalogeId;
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
                '}';
    }

}
