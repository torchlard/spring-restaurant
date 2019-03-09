package com.example.restaurant.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MenuRepository extends JpaRepository<Menu, Long> {
  Menu findByFoodName(String foodName);

  // Menu findByNameAndCategory(String name, String category);

  // @Query("from menu m where m.foodName=:foodName")
  // Menu findMenu(@Param("foodName") String foodName);


}








