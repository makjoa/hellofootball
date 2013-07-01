package net.hellofootball.util;

import java.util.Locale;

import org.springframework.core.Ordered;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.AbstractUrlBasedView;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

public class CustomViewResolver extends UrlBasedViewResolver implements Ordered {

	   protected View loadView(String viewName, Locale locale) throws Exception {
	      AbstractUrlBasedView view = buildView(viewName);
	      View viewObj = (View)     getApplicationContext().getAutowireCapableBeanFactory().initializeBean(view, viewName);
	         if (viewObj instanceof JstlView) {
	            JstlView jv = (JstlView) viewObj;
	            System.out.println(jv.getUrl());
	            System.out.println(jv.getBeanName());
	            if (jv.getBeanName().indexOf("jsp") != 0) {
	                return null;
	            }
	        }
	        return viewObj;
	    }
}
