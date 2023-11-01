Class {
	#name : #TypShaIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaIndex >> addMethod: aMethod [
	cache
		typAt: {#indexed.
				aMethod}
		ifPresent: [ ^ self ]
		ifAbsentPut: [ true ].
	aMethod typShaIsResolveMethod
		ifTrue: [ cache
				typAt: {#method.
						aMethod methodClass.
						aMethod typShaResolvedMethodSelector}
				put: aMethod ].
	aMethod typShaIsResolveVariable
		ifTrue: [ cache
				typAt: {#variable.
						aMethod methodClass.
						aMethod typShaResolvedVariableSelector}
				put: aMethod ].
	aMethod typShaIsResolveType
		ifTrue: [ cache
				typAt: {#type.
						aMethod methodClass}
				put: aMethod ]
]

{ #category : #accessing }
TypShaIndex >> canResolveMethod: aLookup [
	^ cache
		typAt: {#method.
				aLookup receiver classDescription.
				aLookup selector}
		ifPresent: [ :m | true ]
		ifAbsent: [ false ]
]

{ #category : #accessing }
TypShaIndex >> canResolveType: aLookup [
	^ cache
		typAt: {#type.
				aLookup classDescription class}
		ifPresent: [ :m | true ]
		ifAbsent: [ false ]
]

{ #category : #accessing }
TypShaIndex >> canResolveVariable: aLookup [
	^ cache
		typAt: {#variable.
				aLookup receiver classDescription.
				aLookup selector}
		ifPresent: [ :m | true ]
		ifAbsent: [ false ]
]

{ #category : #accessing }
TypShaIndex >> initialize [
	super initialize.
	Smalltalk globals allMethods do: [ :m | self addMethod: m ]
]

{ #category : #accessing }
TypShaIndex >> removeBehavior: aBehavior [
	cache
		typAt: {#indexed.
				aBehavior}
		ifPresent: [ cache
				typRemoveAt: {#indexed.
						aBehavior} ]
		ifAbsent: [ ^ self ].
	(cache at: #method) removeKey: aBehavior ifAbsent: [  "noop" ].
	(cache at: #variable) removeKey: aBehavior ifAbsent: [  "noop" ].
	(cache at: #type) removeKey: aBehavior ifAbsent: [  "noop" ]
]

{ #category : #accessing }
TypShaIndex >> removeMethod: aMethod [
	cache
		typAt: {#indexed.
				aMethod}
		ifPresent: [ cache
				typRemoveAt: {#indexed.
						aMethod} ]
		ifAbsent: [ ^ self ].
	aMethod typShaIsResolveMethod
		ifTrue: [ (cache
				typAt: {#method.
						aMethod methodClass})
				removeKey: aMethod typShaResolvedMethodSelector
				ifAbsent: [  "noop" ] ].
	aMethod typShaIsResolveVariable
		ifTrue: [ (cache
				typAt: {#variable.
						aMethod methodClass})
				removeKey: aMethod typShaResolvedVariableSelector
				ifAbsent: [  "noop" ] ].
	aMethod typShaIsResolveType
		ifTrue: [ (cache typAt: {#type}) removeKey: aMethod methodClass ifAbsent: [  "noop" ] ]
]

{ #category : #accessing }
TypShaIndex >> resultMethod: aLookup root: anotherLookup [
	| method |
	method := cache
			typAt: {#method.
					aLookup receiver classDescription.
					aLookup selector}.
	^ nil
		withArgs: {aLookup.
				anotherLookup}
		executeMethod: method
]

{ #category : #accessing }
TypShaIndex >> resultType: aLookup root: anotherLookup [
	| method |
	method := cache
			typAt: {#type.
					aLookup classDescription class}.
	^ nil
		withArgs: {aLookup.
				anotherLookup}
		executeMethod: method
]

{ #category : #accessing }
TypShaIndex >> resultVariable: aLookup root: anotherLookup [
	| method |
	method := cache
			typAt: {#variable.
					aLookup receiver classDescription.
					aLookup selector}.
	^ nil
		withArgs: {aLookup.
				anotherLookup}
		executeMethod: method
]
