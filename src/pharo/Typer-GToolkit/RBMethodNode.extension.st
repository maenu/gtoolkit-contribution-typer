Extension { #name : #RBMethodNode }

{ #category : #'*Typer-GToolkit' }
RBMethodNode >> typGtCanTypeWithPragma [
	^ true
]

{ #category : #'*Typer-GToolkit' }
RBMethodNode >> typGtTypeWithPragma [
	| pragmas_ result |
	pragmas_ := self pragmas asOrderedCollection.
	result := pragmas_
		detect: [ :e | e selector = #typTypeResultAs: ]
		ifFound: [ :e | pragmas_ remove: e ]
		ifNone: [ RBPragmaNode selector: #typTypeResultAs: arguments: self typTypeForResult asSourceString ]
]
