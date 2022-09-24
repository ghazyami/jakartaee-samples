package com.example.jakartaeeexamples.hello.boundary;

import java.io.IOException;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.faces.annotation.View;
import jakarta.faces.component.UIComponent;
import jakarta.faces.component.html.HtmlOutputLabel;
import jakarta.faces.context.FacesContext;
import jakarta.faces.view.facelets.Facelet;

@View("hello.xhtml")
@ApplicationScoped
public class HelloView extends Facelet {

	@Override
	public void apply(final FacesContext facesContext, final UIComponent uiComponent) throws IOException {
		final HtmlOutputLabel htmlOutputLabel = new HtmlOutputLabel();
		htmlOutputLabel.setValue("test");
		uiComponent.getChildren().add(htmlOutputLabel);
	}
}
