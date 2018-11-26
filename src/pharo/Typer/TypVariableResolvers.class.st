Class {
	#name : #TypVariableResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypVariableResolvers >> typTypeForVariableNamed: aString ofClass: aClass [
	^ self typTypeForVariableNamed: aString ofClass: aClass withDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypVariableResolvers >> typTypeForVariableNamed: aString ofClass: aClass withDiscovered: aSet [
	resolvers
		do: [ :e | 
			(e resolverFor: aClass -> aString)
				ifNotNil: [ :f | 
					| type |
					type := f typTypeWithDiscovered: aSet.
					type isUnknown
						ifFalse: [ ^ type ] ] ].
	^ TypUnknownType instance
]
