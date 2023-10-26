Class {
	#name : #TypVariableLookup,
	#superclass : #TypPropertyLookup,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypVariableLookup class >> receiver: aType selector: aSymbol parent: aLookup [
	^ self index
		at: {aType.
				aSymbol asSymbol.
				aLookup}
		ifAbsentPut: [ self new
				initializeReceiver: aType selector: aSymbol asSymbol;
				initializeParent: aLookup;
				yourself ]
]

{ #category : #accessing }
TypVariableLookup class >> resolver [
	^ resolver
		ifNil: [ resolver := TypTerminalResolver
					resolver: (TypBreadthFirstResolver
							resolvers: {TypDepthFirstResolver resolver: TypPraVariableResolver new.
									TypDepthFirstResolver resolver: TypShaVariableResolver new.
									TypDepthFirstResolver resolver: TypInfVariableResolver new}) ]
]

{ #category : #converting }
TypVariableLookup >> asParent [
	child ifNotNil: [ ^ child ].
	self assert: [ self hasParent ].
	^ child := self class
			receiver: receiver super
			selector: selector
			parent: self
]

{ #category : #accessing }
TypVariableLookup >> canResolve [
	^ receiver canResolveVariable: self
]

{ #category : #accessing }
TypVariableLookup >> resolve [
	self flag: 'FIXME weird'.
	^ [ receiver resolveVariable: self ]
		ensure: [ self assert: [ result isNotNil ] ]
]

{ #category : #accessing }
TypVariableLookup >> withReceiver: aType [
	^ self class
		receiver: (receiver covariant: aType)
		selector: selector
		parent: parent
]
