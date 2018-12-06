Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer-GToolkit' }
RBInstanceVariableNode >> typGtCanTypeWithPragma [
	^ true
]

{ #category : #'*Typer-GToolkit' }
RBInstanceVariableNode >> typGtCanTypeWithShadow [
	^ true
]

{ #category : #'*Typer-GToolkit' }
RBInstanceVariableNode >> typGtTypeWithPragma [
	^ (TypGtCoderTypeFilter new
		type: self methodNode methodClass typAsType;
		yourself)
		&
			(TypGtCoderDefinerFilter new
				name: self name;
				yourself) & (GtCoderImplementorsFilter selector: #initialize)
]
