Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheColor [
	self typCheHasIncompatibilities
		ifTrue: [ ^ Color red ].
	self typCheHasMissingMethods
		ifTrue: [ ^ Color orange ].
	self typCheHasNullables
		ifTrue: [ ^ Color purple ].
	self typCheHasUnknowns
		ifTrue: [ ^ Color blue ].
	^ Color green
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasIncompatibilities [
	^ self typCheHasIncompatibleArguments or: [ self typCheHasIncompatibleAssignments or: [ self typCheHasIncompatibleReturns ] ]
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasIncompatibleArguments [
	((self allChildren select: #isMessage) reject: #isCascade)
		do: [ :e | 
			e arguments
				withIndexDo: [ :f :i | 
					[ [ e typCheCheckArgumentCompatibilityAt: i ]
						on: TypCheNullableTypeError
						do: [  ] ]
						on: TypCheIncompatibleTypeError
						do: [ ^ true ] ] ].
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasIncompatibleAssignments [
	(self allChildren select: #isAssignment)
		do: [ :e | 
			[ e typCheCheckCompatibility ]
				on: TypCheIncompatibleTypeError
				do: [ ^ true ] ].
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasIncompatibleReturns [
	(self allChildren select: #isReturn)
		do: [ :e | 
			[ e typCheCheckCompatibility ]
				on: TypCheIncompatibleTypeError
				do: [ ^ true ] ].
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasMissingMethods [
	((self allChildren select: #isMessage) reject: #isCascade)
		do: [ :e | 
			[ e typCheCheckMethod ]
				on: TypCheNoMethodError
				do: [ ^ true ] ].
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasNullableArguments [
	^ ((((self allChildren select: #isMessage) reject: #isCascade) flatCollect: #arguments) select: [ :e | e typType nullable ])
		anySatisfy: [ :e | 
			| i expected actual |
			i := e parent arguments detectIndex: [ :f | f == e ].
			expected := e parent typTypeForArgumentAt: i.
			actual := e receiver typType.
			(expected >= actual) not and: [ expected >= actual asNonNullableType ] ]
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasNullableReceivers [
	^ ((self allChildren select: #isMessage) reject: #isCascade) anySatisfy: [ :e | e receiver typType nullable ]
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasNullables [
	^ self typCheHasNullableReceivers or: [ self typCheHasNullableArguments ]
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasUnknownArgumentsPassed [
	((self allChildren select: #isMessage) reject: #isCascade)
		do: [ :e | 
			e arguments
				withIndexDo: [ :f :i | 
					(e typTypeForArgumentAt: i) isUnknown
						ifTrue: [ ^ true ] ] ].
	^ false
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasUnknownReceivers [
	^ ((self allChildren select: #isMessage) reject: #isCascade) anySatisfy: [ :e | e receiver typType isUnknown ]
]

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheHasUnknowns [
	^ self typCheHasUnknownArgumentsPassed or: [ self typCheHasUnknownReceivers ]
]
