package com.tianex.pinenjoy.web;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class SolrController {

    private CatalogeService catalogeService;
    private ImageService imageService;

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(@RequestParam("searchContent") String searchContent, Model model) throws IOException, SolrServerException {
        Image image = null;
        List<Image> imagesOfSearch = new ArrayList<Image>();

        SolrDocumentList solrDocumentList = SolrUtils.solr(searchContent);
        for (SolrDocument solrDocument : solrDocumentList) {
            image = imageService.findImageByImageId((String) solrDocument.get("image_id"));
            imagesOfSearch.add(image);
        }

        model.addAttribute("sumOfSearch", solrDocumentList.getNumFound());
        model.addAttribute("cataloges", catalogeService.findAll());
        model.addAttribute("imagesOfSearch", imagesOfSearch);

        return "search";
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
