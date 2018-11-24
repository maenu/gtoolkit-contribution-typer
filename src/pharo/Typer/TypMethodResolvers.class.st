Class {
	#name : #TypMethodResolvers,
	#superclass : #Object,
	#instVars : [
		'resolvers'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodResolvers class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #initialization }
TypMethodResolvers >> initialize [
	super initialize.
	resolvers := OrderedCollection new
]

{ #category : #accessing }
TypMethodResolvers >> resolverFor: aCompiledMethod [
	^ resolvers detect: [ :e | e resolves: aCompiledMethod ] ifNone: [ nil ]
]

{ #category : #accessing }
TypMethodResolvers >> resolvers [
	^ resolvers
]

{ #category : #accessing }
TypMethodResolvers >> resolvers: anObject [
	resolvers := anObject
]

{ #category : #accessing }
TypMethodResolvers >> resolves: aCompiledMethod [
	resolvers anySatisfy: [ :e | e resolves: aCompiledMethod ]
]

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
