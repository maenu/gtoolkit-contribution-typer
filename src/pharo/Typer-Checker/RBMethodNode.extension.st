Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Checker' }
RBMethodNode >> typCheColor [
	self typCheHasIncompatibilities
		ifTrue: [ ^ Color red ].
	self typCheHasMissingMethods
		ifTrue: [ ^ Color orange ].
	self typCheHasNullableReceivers
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
					[ e typCheCheckArgumentCompatibilityAt: i ]
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
RBMethodNode >> typCheHasNullableReceivers [
	^ ((self allChildren select: #isMessage) reject: #isCascade) anySatisfy: [ :e | e receiver typType nullable ]
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
