Extension { #name : #InstanceVariableSlot }

{ #category : #'*Typer-GToolkit' }
InstanceVariableSlot >> typGtShaCanTypeIn: aContext [
	^ true
]

{ #category : #'*Typer-GToolkit' }
InstanceVariableSlot >> typGtShaMethodIn: aContext [
	| shadow |
	self flag: 'FIXME'.
	self assert: [ self typGtShaCanTypeIn: nil ].
	shadow := (TypShaShadow typGtShaFor: owningClass instanceSide)
			ifEmpty: [ TypShaShadow typGtShaNewFor: owningClass ]
			ifNotEmpty: #first.
	^ shadow
		typGtShaVariable: name asSymbol
		type: (owningClass typAsType lookupVariable: name asSymbol)
		in: (owningClass isInstanceSide ifTrue: [ shadow ] ifFalse: [ shadow class ])
]
