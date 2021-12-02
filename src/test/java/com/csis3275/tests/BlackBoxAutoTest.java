package com.csis3275.tests;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.CoreMatchers.is;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.interactions.Actions;

class BlackBoxAutoTest {
	
	private static WebDriver driver;
	private static Map<String, Object> vars;
	static JavascriptExecutor js;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		System.setProperty("webdriver.chrome.driver", "C:\\Users\\dattu\\Downloads\\chromedriver.exe");
		driver = new ChromeDriver();
		js = (JavascriptExecutor) driver;
		vars = new HashMap<String, Object>();
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		driver.quit();
	}

	@BeforeEach
	void setUp() throws Exception {
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void test() {
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		driver.get("http://localhost:8080/");
	    driver.manage().window().setSize(new Dimension(1552, 849));
	    driver.findElement(By.linkText("Login")).click();
	    driver.findElement(By.id("UserName")).click();
	    driver.findElement(By.id("UserName")).sendKeys("dat");
	    driver.findElement(By.cssSelector(".userLogin")).click();
	    driver.findElement(By.id("UserPassword")).click();
	    driver.findElement(By.id("UserPassword")).sendKeys("dat");
	    driver.findElement(By.cssSelector("#login > .btn")).click();
	    driver.findElement(By.cssSelector(".btn-success")).click();
	    driver.findElement(By.id("userName")).click();
	    driver.findElement(By.id("userName")).sendKeys("dat");
	    driver.findElement(By.id("userPassword")).sendKeys("dat");
	    driver.findElement(By.id("firstName")).click();
	    driver.findElement(By.id("firstName")).sendKeys("dat");
	    driver.findElement(By.id("lastName")).sendKeys("tu");
	    driver.findElement(By.id("email")).sendKeys("tudat@mail.com");
	    driver.findElement(By.cssSelector("#user > .btn")).click();
	    driver.findElement(By.id("UserName")).click();
	    driver.findElement(By.id("UserName")).sendKeys("dat");
	    driver.findElement(By.id("UserPassword")).sendKeys("dat");
	    driver.findElement(By.cssSelector("#login > .btn")).click();
	    driver.findElement(By.id("navbarDropdown")).click();
	    driver.findElement(By.linkText("Best-Ever Flan")).click();
	    driver.findElement(By.id("navbarDropdown")).click();
	    driver.findElement(By.linkText("My Recipe")).click();
	    driver.findElement(By.cssSelector(".nav-item:nth-child(1) > .nav-link")).click();
	    driver.findElement(By.id("RecipeTitle")).click();
	    driver.findElement(By.id("RecipeTitle")).sendKeys("testing recipe");
	    driver.findElement(By.id("Description")).click();
	    driver.findElement(By.id("Description")).sendKeys("this is a good recipe");
	    driver.findElement(By.id("Ingredient")).click();
	    driver.findElement(By.id("Ingredient")).sendKeys("1 egg");
	    driver.findElement(By.id("Preparation")).click();
	    driver.findElement(By.id("Preparation")).sendKeys("cook it");
	    driver.findElement(By.cssSelector(".btn-primary")).click();
	    driver.findElement(By.linkText("testing recipe")).click();
	    driver.findElement(By.id("navbarDropdown")).click();
	    driver.findElement(By.linkText("My Recipe")).click();
	    driver.findElement(By.linkText("Edit")).click();
	    driver.findElement(By.id("RecipeTitle")).click();
	    driver.findElement(By.id("RecipeTitle")).sendKeys("testing recipe after edit");
	    driver.findElement(By.cssSelector(".btn-primary")).click();
	    driver.findElement(By.linkText("testing recipe after edit")).click();
	    driver.findElement(By.id("navbarDropdown")).click();
	    driver.findElement(By.linkText("My Recipe")).click();
	    driver.findElement(By.linkText("Delete")).click();
	    driver.findElement(By.id("navbarDropdown")).click();
	    driver.findElement(By.cssSelector(".show > li:nth-child(1) > .dropdown-item")).click();
	    driver.findElement(By.cssSelector(".nav-item:nth-child(1) > .nav-link")).click();
	    driver.findElement(By.cssSelector("input:nth-child(11)")).click();
	    driver.findElement(By.name("MenuTitle")).click();
	    driver.findElement(By.name("MenuTitle")).sendKeys("testing menu");
	    driver.findElement(By.name("Description")).click();
	    driver.findElement(By.name("Description")).sendKeys("this is for testing");
	    driver.findElement(By.cssSelector("input:nth-child(11)")).click();
	    driver.findElement(By.linkText("Add")).click();
	    driver.findElement(By.linkText("Add")).click();
	    driver.findElement(By.cssSelector("input:nth-child(1)")).click();
	    driver.findElement(By.linkText("testing menu")).click();
	    driver.findElement(By.linkText("Menu")).click();
	    driver.findElement(By.cssSelector(".show > li:nth-child(1) > .dropdown-item")).click();
	    driver.findElement(By.linkText("Edit")).click();
	    driver.findElement(By.name("MenuTitle")).click();
	    driver.findElement(By.name("MenuTitle")).sendKeys("testing menu after edit");
	    driver.findElement(By.cssSelector("html")).click();
	    driver.findElement(By.cssSelector("input:nth-child(9)")).click();
	    driver.findElement(By.linkText("Add")).click();
	    driver.findElement(By.cssSelector("#myTable2 tr:nth-child(3) .btn")).click();
	    driver.findElement(By.id("myInput")).click();
	    driver.findElement(By.cssSelector("input:nth-child(1)")).click();
	    driver.findElement(By.linkText("testing menu after edit")).click();
	    driver.findElement(By.linkText("Menu")).click();
	    driver.findElement(By.cssSelector(".show > li:nth-child(1) > .dropdown-item")).click();
	    driver.findElement(By.linkText("Delete")).click();
	    driver.findElement(By.linkText("Computing Cooker")).click();
	    driver.findElement(By.linkText("Best-Ever Flan")).click();
	    driver.findElement(By.id("Content")).click();
	    driver.findElement(By.id("Content")).sendKeys("hello, my name is dat");
	    driver.findElement(By.cssSelector(".btn-primary")).click();
	    driver.findElement(By.cssSelector("button > strong")).click();
	    driver.findElement(By.linkText("Edit")).click();
	    driver.findElement(By.id("Content")).click();
	    driver.findElement(By.id("Content")).sendKeys("hello, my name is dat after edit");
	    driver.findElement(By.cssSelector(".btn-primary")).click();
	    driver.findElement(By.linkText("Delete")).click();
	    driver.findElement(By.id("item")).click();
	    driver.findElement(By.id("item")).sendKeys("cream");
	    driver.findElement(By.cssSelector(".btn-outline-success")).click();
	}

}
