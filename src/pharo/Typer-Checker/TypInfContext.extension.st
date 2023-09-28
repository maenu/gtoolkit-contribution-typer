Extension { #name : #TypInfContext }

{ #category : #'*Typer-Checker' }
TypInfContext >> typCheColor [
	self typCheHasIncompatibilities ifTrue: [ ^ Color red ].
	self typCheHasMissingMethods ifTrue: [ ^ Color orange ].
	self typCheHasUnknowns ifTrue: [ ^ Color blue ].
	self typCheHasNullables ifTrue: [ ^ Color purple ].
	^ Color green
]

{ #category : #'*Typer-Checker' }
TypInfContext >> typCheHasIncompatibilities [
	self typCheHasIncompatibleArguments ifTrue: [ ^ true ].
	self typCheHasIncompatibleAssignments ifTrue: [ ^ true ].
	self typCheHasIncompatibleReturns ifTrue: [ ^ true ].
	^ false
]

{ #category : #'*Typer-Checker' }
TypInfContext >> typCheHasIncompatibleArguments [
	((nodes flatCollect: #values) select: #isMessage)
		do: [ :n | n arguments withIndexDo: [ :t :i | n typCheCheckArgumentCompatibilityAt: i ] ]
		on: TypCheIncompatibleTypeError
		do: [ ^ true ].
	^ false
]

{ #category : #'*Typer-Checker' }
TypInfContext >> typCheHasIncompatibleAssignments [
	[ ((nodes flatCollect: #values) select: #isAssignment)
		do: #typCheCheckCompatibility ] on: TypCheIncompatibleTypeError do: [ ^ true ].
	^ false
]

{ #category : #'*Typer-Checker' }
TypInfContext >> typCheHasIncompatibleReturns [
	[ (root in at: #return ifAbsent: [ #() ]) do: #typCheCheckCompatibility ]
		on: TypCheIncompatibleTypeError
		do: [ ^ true ].
	^ false
]

{ #category : #'*Typer-Checker' }
TypInfContext >> typCheHasMissingMethods [
	[ ((nodes flatCollect: #values) select: #isMessage) do: #typCheCheckMethod ]
		on: TypCheNoMethodError
		do: [ ^ true ].
	^ false
]

{ #category : #'*Typer-Checker' }
TypInfContext >> typCheHasNullableArguments [
	^ ((nodes flatCollect: #values) select: #isMessage)
		anySatisfy: [ :m | 
			(m inArguments
				withIndexSelect: [ :n :i | 
					| expected actual |
					expected := m type arguments at: i.
					actual := n type.
					actual isNullable
						and: [ (expected >= actual) not and: [ expected >= actual asNonNullable ] ] ])
				isNotEmpty ]
]

{ #category : #'*Typer-Checker' }
TypInfContext >> typCheHasNullableReceivers [
	^ ((nodes flatCollect: #values) select: #isMessage)
		anySatisfy: [ :m | 
			(m receiver isNullable and: [ m receiver canLookupMethod: m selector ])
				isNotEmpty ]
]

{ #category : #'*Typer-Checker' }
TypInfContext >> typCheHasNullableReturns [
	[ (root in at: #return ifAbsent: [ #() ]) do: #typCheCheckNullables ]
		on: TypCheNullableTypeError
		do: [ ^ true ].
	^ false
]

{ #category : #'*Typer-Checker' }
TypInfContext >> typCheHasNullables [
	self typCheHasNullableReceivers ifTrue: [ ^ true ].
	self typCheHasNullableArguments ifTrue: [ ^ true ].
	self typCheHasNullableReturns ifTrue: [ ^ true ].
	^ false
]

{ #category : #'*Typer-Checker' }
TypInfContext >> typCheHasUnknownArguments [
	^ root type arguments anySatisfy: #isUnknown
]

{ #category : #'*Typer-Checker' }
TypInfContext >> typCheHasUnknownArgumentsPassed [
	((nodes flatCollect: #values) select: #isMessage)
		do: [ :m | 
			m arguments
				withIndexDo: [ :t :i | (m type arguments at: i) isUnknown ifTrue: [ ^ true ] ] ].
	^ false
]

{ #category : #'*Typer-Checker' }
TypInfContext >> typCheHasUnknownReceivers [
	^ ((nodes flatCollect: #values) select: #isMessage)
		anySatisfy: [ :m | m receiver isUnknown ]
]

{ #category : #'*Typer-Checker' }
TypInfContext >> typCheHasUnknownResult [
	^ root type result isUnknown
]

{ #category : #'*Typer-Checker' }
TypInfContext >> typCheHasUnknownTemporaries [
	^ ((nodes flatCollect: #values)
		select: [ :n | 
			n node isTemp
				and: [ n node isArgumentVariable not and: [ n node isDefinition ] ] ])
		anySatisfy: [ :n | n type isUnknown ]
]

{ #category : #'*Typer-Checker' }
TypInfContext >> typCheHasUnknowns [
	self typCheHasUnknownArgumentsPassed ifTrue: [ ^ true ].
	self typCheHasUnknownReceivers ifTrue: [ ^ true ].
	self typCheHasUnknownResult ifTrue: [ ^ true ].
	self typCheHasUnknownArguments ifTrue: [ ^ true ].
	self typCheHasUnknownTemporaries ifTrue: [ ^ true ].
	^ false
]
