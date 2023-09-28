Extension { #name : #MethodModified }

{ #category : #'*Typer-Shadow' }
MethodModified >> typShaInvalidateIndex [
	TypShaIndex instance
		removeMethod: oldMethod;
		addMethod: method
]
