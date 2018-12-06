Extension { #name : #RBMessageNode }

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtCanTypeWithPragma [
	^ true
]

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtCanTypeWithShadow [
	^ true
]

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtTypeWithPragma [
	^ (TypGtCoderTypeFilter new
		type: self receiver typType;
		yourself) & (GtCoderImplementorsFilter selector: self selector)
]
