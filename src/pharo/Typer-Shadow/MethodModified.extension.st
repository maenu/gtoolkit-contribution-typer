Extension { #name : #MethodModified }

{ #category : #'*Typer-Shadow' }
MethodModified >> typShaInvalidate [
	<typInvalidate: 30>
	TypShaIndex instance
		removeMethod: oldMethod;
		addMethod: method
]
