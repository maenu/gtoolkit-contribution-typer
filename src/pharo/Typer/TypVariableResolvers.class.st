Class {
	#name : #TypVariableResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypVariableResolvers >> typTypesForVariableNamed: aString ofClass: aClass [
	^ self typTypesForVariableNamed: aString ofClass: aClass withDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypVariableResolvers >> typTypesForVariableNamed: aString ofClass: aClass withDiscovered: aSet [
	resolvers
		do: [ :e | 
			(e resolverFor: aClass -> aString)
				ifNotNil: [ :f | 
					| types |
					types := f typTypesWithDiscovered: aSet.
					types isEmpty
						ifFalse: [ ^ types ] ] ].
	^ TypTypes new
]
