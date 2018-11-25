Class {
	#name : #TypMethodResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodResolvers >> typTypesForArgumentAt: anInteger ofMethod: aCompiledMethod [
	^ self typTypesForArgumentAt: anInteger ofMethod: aCompiledMethod withDiscovered: Set new
]

{ #category : #accessing }
TypMethodResolvers >> typTypesForArgumentAt: anInteger ofMethod: aCompiledMethod withDiscovered: aSet [
	resolvers
		do: [ :e | 
			(e resolverFor: aCompiledMethod)
				ifNotNil: [ :f | 
					| types |
					types := f typTypesForArgumentAt: anInteger withDiscovered: aSet.
					types isEmpty
						ifFalse: [ ^ types ] ] ].
	^ TypTypes new
]

{ #category : #'as yet unclassified' }
TypMethodResolvers >> typTypesForResultForReceivers: aTypes ofMethod: aCompiledMethod [
	^ self typTypesForResultForReceivers: aTypes ofMethod: aCompiledMethod withDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypMethodResolvers >> typTypesForResultForReceivers: aTypes ofMethod: aCompiledMethod withDiscovered: aSet [
	resolvers
		do: [ :e | 
			(e resolverFor: aCompiledMethod)
				ifNotNil: [ :f | 
					| types |
					types := f typTypesForResultForReceivers: aTypes withDiscovered: aSet.
					types isEmpty
						ifFalse: [ ^ types ] ] ].
	^ TypTypes new
]

{ #category : #'as yet unclassified' }
TypMethodResolvers >> typTypesForResultOfMethod: aCompiledMethod [
	^ self typTypesForResultOfMethod: aCompiledMethod withDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypMethodResolvers >> typTypesForResultOfMethod: aCompiledMethod withDiscovered: aSet [
	resolvers
		do: [ :e | 
			(e resolverFor: aCompiledMethod)
				ifNotNil: [ :f | 
					| types |
					types := f typTypesForResultWithDiscovered: aSet.
					types isEmpty
						ifFalse: [ ^ types ] ] ].
	^ TypTypes new
]
