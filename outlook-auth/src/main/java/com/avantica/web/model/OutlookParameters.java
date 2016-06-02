package com.avantica.web.model;

public enum OutlookParameters {
	
	TOKEN_URL("url", "https://login.microsoftonline.com/common/oauth2/v2.0/token"),
	TOKEN_LOGIN("url", "https://login.microsoftonline.com/common/oauth2/v2.0/authorize"),
	CLIEND_ID("client_id", "bba8a36d-866a-4745-9bb3-018fd877587b"),
	CLIEND_SEC("client_secret", "rOXah2VrXRknsdP3p3TYHJK"),
	AUTHORIZ("grant_type", "authorization_code"),
	RESPONSE_TYPE_CODE("response_type", "code"),
	RESPONSE_TYPE_TOKEN("response_type", "token"),
	SCOPE("scope", "openid+offline_access+profile+https://outlook.office.com/mail.read+https://outlook.office.com/mail.send"),
	REDIRECT("redirect_uri", "https://xinefserver.com:9090/outlook-auth/autenticate"),
	RESOURCE("resource", "https://xinefserver.com:9090/outlook-auth/");
	
	private String descripcion;
	private String codigo;

	OutlookParameters(final String descripcion, final String codigo) {
		this.descripcion = descripcion;
		this.codigo = codigo;
	}

	public String getCodigo() {
		return codigo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public static OutlookParameters getOutlookParametersPorCodigo(final String codigo) {
		return null;
	}
	
}
