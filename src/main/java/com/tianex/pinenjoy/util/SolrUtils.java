package com.tianex.pinenjoy.util;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocumentList;

import java.io.IOException;

/**
 * 基于solrj的工具类，提供搜索相关的方法
 * @author TianEx
 * @version 0.1
 */
public abstract class SolrUtils {

    public static final String SOLR_URL = "http://localhost:8788/solr/db";

    /**
     * 根据查询参数对solr进行查询获得结果
     * @param queryArgs
     * @return
     * @throws IOException
     * @throws SolrServerException
     */
    public static SolrDocumentList solr(String queryArgs) throws IOException, SolrServerException {
        SolrClient solr = new HttpSolrClient(SOLR_URL);

        SolrQuery parameters = new SolrQuery();
        parameters.set("q", queryArgs);
        parameters.addSort("image_id", SolrQuery.ORDER.asc);
        parameters.setHighlight(true);
        parameters.addHighlightField("image_accountNickname");
        parameters.setHighlightSimplePre("<font color='red'>");
        parameters.setHighlightSimplePost("</font>");

        parameters.setHighlightSnippets(1);// 结果分片数，默认为1
        parameters.setHighlightFragsize(1000);// 每个分片的最大长度，默认为100

        parameters.setFacet(true).setFacetMinCount(1)
                .setFacetLimit(5)
                .addFacetField("image_id");

        QueryResponse response = solr.query(parameters);
        SolrDocumentList solrDocumentList = response.getResults();

        return solrDocumentList;
    }

}

