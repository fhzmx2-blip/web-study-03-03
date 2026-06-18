<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>맛집 목록</title>
</head>
<body>
    <div class="breadcrumb-area" style="background-image: url(../img/bg-img/breadcrumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcrumb-title text-center">
                        <h2>맛집 목록</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="breadcrumb-nav">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home" aria-hidden="true"></i></a></li>
                            <li class="breadcrumb-item active" aria-current="page">맛집 목록</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
<section class="archive-area section_padding_80">
    <div class="container">
        <div class="row">
        
            <c:forEach var="vo" items="${list}">
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post wow fadeInUp" data-wow-delay="0.1s">
                        <div class="post-thumb">
                          <a href="../food/detail_before.do?no=${vo.no }">
                            <img src="${vo.poster}" alt="">
                          </a>
                        </div>
                        <div class="post-content">
                            <div class="post-meta d-flex">
                                <div class="post-author-date-area d-flex">
                                    <div class="post-author">
                                        <a href="#">${vo.type}</a>
                                    </div>
                                    <div class="post-date">
                                        <a href="#">${vo.phone}</a>
                                    </div>
                                </div>
                            </div>
                            <div class="post-comment-share-area d-flex">
                                <div class="post-favourite">
                                    <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i>${vo.likecount}</a>
                                </div>
                                <div class="post-comments">
                                    <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i>${vo.replycount}</a>
                                </div>
                                <div class="post-share">
                                    <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                </div>
                            </div>
                            <a href="../food/detail_before.do?no=${vo.no }">
                                <h4 class="post-headline">${vo.name}</h4>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            
            <div class="col-12">
                <div class="pagination-area d-sm-flex mt-15">
                    <nav aria-label="#">
                        <ul class="pagination">
                            <c:if test="${startPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="../food/list.do?page=${startPage-1}">이전 <i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
                                </li>
                            </c:if>
                            
                            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                <li class="page-item ${curpage == i ? 'active' : ''}">
                                    <a class="page-link" href="../food/list.do?page=${i}">${i}</a>
                                </li>
                            </c:forEach>
                            
                            <c:if test="${endPage < totalpage}">
                                <li class="page-item">
                                    <a class="page-link" href="../food/list.do?page=${endPage+1}">다음 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
                <div class="page-status">
                    <p>Page ${curpage} of ${totalpage} results</p>
                </div>
            </div>
            
        </div>
    </div>
</section>
</body>
</html>