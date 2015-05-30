package com.tianex.pinenjoy.web;

import com.tianex.pinenjoy.core.Constant;
import com.tianex.pinenjoy.core.Page;
import com.tianex.pinenjoy.domain.Account;
import com.tianex.pinenjoy.domain.Cataloge;
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
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class SolrController {

    private ImageService imageService;
    private CatalogeService catalogeService;
    private AccountService accountService;

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(@RequestParam("searchContent") String searchContent, @RequestParam(required = false) String accountId,
                         Model model)
            throws IOException, SolrServerException {
        Account currentAccount = null;
        if (accountId != null && accountId.trim() != "") {
            currentAccount = accountService.findAccountByAccountId(accountId);
        }

        SolrDocumentList solrDocumentList = SolrUtils.solr(searchContent);
        Image image = null;
        List<Image> imagesOfSearch = new ArrayList<Image>(7);

        int i = 1;
        for (SolrDocument solrDocument : solrDocumentList) {
            image = imageService.findImageByImageId((String) solrDocument.get("image_id"));
            imagesOfSearch.add(image);
            if (i++ > 5) {
                break;
            }
        }

        List<Cataloge> cataloges = catalogeService.findAll();
        model.addAttribute("cataloges", cataloges);

        model.addAttribute("currentAccount", currentAccount);
        model.addAttribute("searchContent", searchContent);
        model.addAttribute("numFound", solrDocumentList.getNumFound());
        model.addAttribute("imagesOfSearch", imagesOfSearch);

        return "search";
    }


    @RequestMapping(value = "/tosearch/{searchContent}/{pageNo}")
    @ResponseBody
    public SolrDocumentList searchAsy(@PathVariable String searchContent, @PathVariable int pageNo)
            throws IOException, SolrServerException {
        SolrDocumentList solrDocumentList = SolrUtils.solr(searchContent);

        return solrDocumentList;
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
