package com.tianex.pinenjoy.web;

import com.tianex.pinenjoy.core.Page;
import com.tianex.pinenjoy.domain.Image;
import com.tianex.pinenjoy.service.AccountService;
import com.tianex.pinenjoy.service.CatalogeService;
import com.tianex.pinenjoy.service.ImageService;
import com.tianex.pinenjoy.util.SolrUtils;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class SolrController {

    private CatalogeService catalogeService;
    private ImageService imageService;

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String showSearch(@RequestParam("searchContent") String searchContent, Model model) {
        /*Image image = null;
        List<Image> imagesOfSearch = new ArrayList<Image>();

        SolrDocumentList solrDocumentList = SolrUtils.solr(searchContent);
        for (SolrDocument solrDocument : solrDocumentList) {
            image = imageService.findImageByImageId((String) solrDocument.get("image_id"));
            imagesOfSearch.add(image);
        }

        model.addAttribute("sumOfSearch", solrDocumentList.getNumFound());
        model.addAttribute("cataloges", catalogeService.findAll());
        model.addAttribute("imagesOfSearch", imagesOfSearch);*/
        model.addAttribute("searchContent", searchContent);

        return "search";
    }

    @RequestMapping(value = "/{searchContent}/{pageNo}/search")
    @ResponseBody
    public Page<Image> search(@PathVariable String searchContent, @PathVariable int pageNo)
            throws IOException, SolrServerException {
        Image image = null;
        List<Image> imagesOfSearch = new ArrayList<Image>();

        SolrDocumentList solrDocumentList = SolrUtils.solr(searchContent);
        for (SolrDocument solrDocument : solrDocumentList) {
            image = imageService.findImageByImageId((String) solrDocument.get("image_id"));
            imagesOfSearch.add(image);
        }

        Page<Image> images = new Page();
        images.setPageNo(pageNo);
        images.setData(imagesOfSearch);
        images.setTotalCount(imagesOfSearch.size());
        images.setStartIndex(Page.getStartOfPage(pageNo, Page.DEFAULT_PAGE_SIZE));

        return images;
    }

    @Resource
    public void setCatalogeService(CatalogeService catalogeService) {
        this.catalogeService = catalogeService;
    }

    @Resource
    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
    }

}
