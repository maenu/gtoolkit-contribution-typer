Extension { #name : #InstanceVariableSlot }

{ #category : #'*Typer-GToolkit' }
InstanceVariableSlot >> typGtCanType [
	^ true
]

{ #category : #'*Typer-GToolkit' }
InstanceVariableSlot >> typGtShadowMethod [

	| shadow |
	self assert: [ self typGtCanType ].
	shadow := (TypShaShadow typGtShadowFor: owningClass instanceSide)
		          ifEmpty: [ TypShaShadow typGtNewShadowFor: owningClass ]
		          ifNotEmpty: #first.
	^ shadow
		  typGtShadowVariable: name asSymbol
		  type: (owningClass typAsType lookupVariable: name asSymbol)
		  in: (owningClass isInstanceSide
				   ifTrue: [ shadow ]
				   ifFalse: [ shadow class ])
]
