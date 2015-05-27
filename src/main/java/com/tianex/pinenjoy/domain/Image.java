package com.tianex.pinenjoy.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
@Table(name = "t_image")
public class Image implements Serializable {
    private static final long serialVersionUID = 7886311010994984923L;

    private String imageId;

    private String imageTitle;
    private String imageDescription;
    private String imageCatalogeName;

    private long imageScore;
    private long imageLikeCount;
    private long imageShareCount;
    private long imageDislikeCount;
    private long imageDownloadCount;
    private long imageCollectCount;

    private String imageLocation;
    private Timestamp imageUploadTime;

    private boolean imageChecked;

    private String imageAccountNickname;
    private String imageAccountThumb;

    private boolean imageIsAutoDelete;
    private Timestamp imageAutoDeleteTime;

    public Image() {
    }


    @Id
    @Column(name = "image_id")
    public String getImageId() {
        return imageId;
    }

    public void setImageId(String imageId) {
        this.imageId = imageId;
    }

    @Column(name = "image_title")
    public String getImageTitle() {
        return imageTitle;
    }

    public void setImageTitle(String imageTitle) {
        this.imageTitle = imageTitle;
    }

    @Column(name = "image_description")
    public String getImageDescription() {
        return imageDescription;
    }

    public void setImageDescription(String imageDescription) {
        this.imageDescription = imageDescription;
    }

    @Column(name = "image_catalogeName")
    public String getImageCatalogeName() {
        return imageCatalogeName;
    }

    public void setImageCatalogeName(String imageCatalogeName) {
        this.imageCatalogeName = imageCatalogeName;
    }

    @Column(name = "image_score")
    public long getImageScore() {
        return imageScore;
    }

    public void setImageScore(long imageScore) {
        this.imageScore = imageScore;
    }

    @Column(name = "image_likeCount")
    public long getImageLikeCount() {
        return imageLikeCount;
    }

    public void setImageLikeCount(long imageLikeCount) {
        this.imageLikeCount = imageLikeCount;
    }

    @Column(name = "image_shareCount")
    public long getImageShareCount() {
        return imageShareCount;
    }

    public void setImageShareCount(long imageShareCount) {
        this.imageShareCount = imageShareCount;
    }

    @Column(name = "image_disLikeCount")
    public long getImageDislikeCount() {
        return imageDislikeCount;
    }

    public void setImageDislikeCount(long imageDislikeCount) {
        this.imageDislikeCount = imageDislikeCount;
    }

    @Column(name = "image_downloadCount")
    public long getImageDownloadCount() {
        return imageDownloadCount;
    }

    public void setImageDownloadCount(long imageDownloadCount) {
        this.imageDownloadCount = imageDownloadCount;
    }

    @Column(name = "image_collectCount")
    public long getImageCollectCount() {
        return imageCollectCount;
    }

    public void setImageCollectCount(long imageCollectCount) {
        this.imageCollectCount = imageCollectCount;
    }

    @Column(name = "image_location")
    public String getImageLocation() {
        return imageLocation;
    }

    public void setImageLocation(String imageLocation) {
        this.imageLocation = imageLocation;
    }

    @Column(name = "image_uploadTime")
    public Timestamp getImageUploadTime() {
        return imageUploadTime;
    }

    public void setImageUploadTime(Timestamp imageUploadTime) {
        this.imageUploadTime = imageUploadTime;
    }

    @Column(name = "image_checked")
    public boolean getImageChecked() {
        return imageChecked;
    }

    public void setImageChecked(boolean imageChecked) {
        this.imageChecked = imageChecked;
    }

    @Column(name = "image_accountNickname")
    public String getImageAccountNickname() {
        return imageAccountNickname;
    }

    public void setImageAccountNickname(String imageAccountNickname) {
        this.imageAccountNickname = imageAccountNickname;
    }

    @Column(name = "image_isAutoDelete")
    public boolean getImageIsAutoDelete() {
        return imageIsAutoDelete;
    }

    public void setImageIsAutoDelete(boolean imageIsAutoDelete) {
        this.imageIsAutoDelete = imageIsAutoDelete;
    }

    @Column(name = "image_autoDeleteTime")
    public Timestamp getImageAutoDeleteTime() {
        return imageAutoDeleteTime;
    }

    public void setImageAutoDeleteTime(Timestamp imageAutoDeleteTime) {
        this.imageAutoDeleteTime = imageAutoDeleteTime;
    }

    @Column(name = "image_accountThumb")
    public String getImageAccountThumb() {
        return imageAccountThumb;
    }

    public void setImageAccountThumb(String imageAccountThumb) {
        this.imageAccountThumb = imageAccountThumb;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Image image = (Image) o;

        return !(imageId != null ? !imageId.equals(image.imageId) : image.imageId != null);

    }

    @Override
    public int hashCode() {
        return imageId != null ? imageId.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "Image{" +
                "imageId='" + imageId + '\'' +
                ", imageTitle='" + imageTitle + '\'' +
                ", imageDescription='" + imageDescription + '\'' +
                ", imageCatalogeName='" + imageCatalogeName + '\'' +
                ", imageScore=" + imageScore +
                ", imageLikeCount=" + imageLikeCount +
                ", imageShareCount=" + imageShareCount +
                ", imageDislikeCount=" + imageDislikeCount +
                ", imageDownloadCount=" + imageDownloadCount +
                ", imageCollectCount=" + imageCollectCount +
                ", imageLocation='" + imageLocation + '\'' +
                ", imageUploadTime=" + imageUploadTime +
                ", imageChecked=" + imageChecked +
                ", imageAccountNickname='" + imageAccountNickname + '\'' +
                ", imageIsAutoDelete=" + imageIsAutoDelete +
                ", imageAutoDeleteTime=" + imageAutoDeleteTime +
                '}';
    }

}
