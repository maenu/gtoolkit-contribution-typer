Class {
	#name : #TypMethodResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodResolvers >> typTypeForArgumentAt: anInteger ofMethod: aCompiledMethod [
	^ self typTypeForArgumentAt: anInteger ofMethod: aCompiledMethod withDiscovered: Set new
]

{ #category : #accessing }
TypMethodResolvers >> typTypeForArgumentAt: anInteger ofMethod: aCompiledMethod withDiscovered: aSet [
	((resolvers select: [ :e | e resolves: aCompiledMethod ]) collect: [ :e | e resolverFor: aCompiledMethod ])
		do: [ :e | 
			| type |
			type := e typTypeForArgumentAt: anInteger withDiscovered: aSet.
			type isUnknown
				ifFalse: [ ^ type ] ].
	^ TypUnknownType instance
]

{ #category : #'as yet unclassified' }
TypMethodResolvers >> typTypeForResultForReceivers: aType ofMethod: aCompiledMethod [
	^ self typTypeForResultForReceivers: aType ofMethod: aCompiledMethod withDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypMethodResolvers >> typTypeForResultForReceivers: aType ofMethod: aCompiledMethod withDiscovered: aSet [
	((resolvers select: [ :e | e resolves: aCompiledMethod ]) collect: [ :e | e resolverFor: aCompiledMethod ])
		do: [ :e | 
			| type |
			type := e typTypeForResultForReceiver: aType withDiscovered: aSet.
			type isUnknown
				ifFalse: [ ^ type ] ].
	^ TypUnknownType instance
]

{ #category : #'as yet unclassified' }
TypMethodResolvers >> typTypeForResultOfMethod: aCompiledMethod [
	^ self typTypeForResultOfMethod: aCompiledMethod withDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypMethodResolvers >> typTypeForResultOfMethod: aCompiledMethod withDiscovered: aSet [
	((resolvers select: [ :e | e resolves: aCompiledMethod ]) collect: [ :e | e resolverFor: aCompiledMethod ])
		do: [ :e | 
			| type |
			type := e typTypeForResultWithDiscovered: aSet.
			type isUnknown
				ifFalse: [ ^ type ] ].
	^ TypUnknownType instance
]
