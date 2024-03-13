package com.fpt.prj301.service.impl;

import com.fpt.prj301.model.Review;
import com.fpt.prj301.repository.ReviewRepository;
import com.fpt.prj301.service.ReviewService;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReviewServiceImpl implements ReviewService {
    
    private final ReviewRepository reviewRepo = new ReviewRepository();

    @Override
    public List<Review> GetAllReview(int id) {
        List<Review> list = new ArrayList<>();
        try {
            list = this.reviewRepo.getAllReview(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }

    @Override
    public int CountReviewProduct(int id) {
        int count = 0;
        try {
            count = this.reviewRepo.countReviewProduct(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return count;
    }

    @Override
    public int CountReviewRating5(int id) {
        int count = 0;
        try {
            count = this.reviewRepo.countReviewRating5(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return count;
    }

    @Override
    public int CountReviewRating4(int id) {
        int count = 0;
        try {
            count = this.reviewRepo.countReviewRating4(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return count;
    }

    @Override
    public int CountReviewRating3(int id) {
        int count = 0;
        try {
            count = this.reviewRepo.countReviewRating3(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return count;
    }

    @Override
    public int CountReviewRating2(int id) {
        int count = 0;
        try {
            count = this.reviewRepo.countReviewRating2(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return count;
    }

    @Override
    public int CountReviewRating1(int id) {
        int count = 0;
        try {
            count = this.reviewRepo.countReviewRating1(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return count;
    }

    @Override
    public int InsertReview(int uId, int pId, String text, int rating) {
        int insert = 0;
        try {
            insert = this.reviewRepo.insertReview(uId, pId, text, rating);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return insert;
    }
    
}
