Extension { #name : #String }

{ #category : #'*Typer-Inference' }
String >> typInfType [

	^ TypValueType value: self superType: self class typAsType
]
