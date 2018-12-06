Extension { #name : #RBGlobalNode }

{ #category : #'*Typer-GToolkit' }
RBGlobalNode >> typGtCanTypeWithPragma [
	^ self typHasDefiningClass
]

{ #category : #'*Typer-GToolkit' }
RBGlobalNode >> typGtCanTypeWithShadow [
	^ self binding isClassVariable or: [ self binding typIsFromSharedPool ]
]

{ #category : #'*Typer-GToolkit' }
RBGlobalNode >> typGtTypeWithPragma [
	self assert: [ self typGtCanTypeWithPragma ].
	^ (TypGtCoderTypeFilter new
		type: self typDefiningClass typAsType;
		yourself)
		&
			(TypGtCoderDefinerFilter new
				name: self name;
				yourself) & (GtCoderImplementorsFilter selector: #initialize)
]
