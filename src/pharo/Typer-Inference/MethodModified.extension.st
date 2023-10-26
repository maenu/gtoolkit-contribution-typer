Extension { #name : #MethodModified }

{ #category : #'*Typer-Inference' }
MethodModified >> typInfInvalidate [
	<typInvalidate: 20>
	TypInfIndex instance
		removeMethod: oldMethod;
		addMethod: method
]
