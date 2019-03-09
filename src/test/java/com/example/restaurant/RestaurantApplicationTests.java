package com.example.restaurant;

import com.example.restaurant.DAO.Menu;
import com.example.restaurant.DAO.MenuRepository;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RestaurantApplicationTests {

	@Autowired
	private MenuRepository menuRepository;

	@Test
	public void test() throws Exception {
		menuRepository.save(new Menu("food1", "chicken", 12.1f, 5));
		menuRepository.save(new Menu("food2", "ham", 43.0f, 2));

		Assert.assertEquals(2, menuRepository.findAll().size());

		System.out.println(menuRepository.findByFoodName("food1"));
	}

	@Test
	public void contextLoads() {
	}

}
