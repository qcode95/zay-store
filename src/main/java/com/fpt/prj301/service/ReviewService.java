package com.fpt.prj301.service;

import com.fpt.prj301.model.Review;
import java.util.List;

public interface ReviewService {

    public List<Review> GetAllReview(int id);
    
    public int CountReviewProduct(int id);
    
    public int CountReviewRating5(int id);
    
    public int CountReviewRating4(int id);
    
    public int CountReviewRating3(int id);
    
    public int CountReviewRating2(int id);
    
    public int CountReviewRating1(int id);

    public int InsertReview(int uId, int pId, String text, int rating);
    
}
