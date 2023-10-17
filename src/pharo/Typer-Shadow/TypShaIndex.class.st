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
		ifTrue: [ (cache
				typAt: {#method.
						aMethod methodClass.
						aMethod typShaResolvedMethodSelector}
				ifAbsentPut: [ IdentitySet new ]) add: aMethod ].
	aMethod typShaIsResolveVariable
		ifTrue: [ (cache
				typAt: {#variable.
						aMethod methodClass.
						aMethod typShaResolvedVariableSelector}
				ifAbsentPut: [ IdentitySet new ]) add: aMethod ].
	aMethod typShaIsResolveType
		ifTrue: [ (cache
				typAt: {#type.
						aMethod methodClass}
				ifAbsentPut: [ IdentitySet new ]) add: aMethod ]
]

{ #category : #accessing }
TypShaIndex >> initialize [
	super initialize.
	Smalltalk globals allMethods do: [ :m | self addMethod: m ]
]

{ #category : #accessing }
TypShaIndex >> invalidateOnClassChange: aClassAnnouncement [
	aClassAnnouncement typShaInvalidateIndex
]

{ #category : #accessing }
TypShaIndex >> invalidateOnMethodChange: aMethodAnnouncement [
	aMethodAnnouncement typShaInvalidateIndex
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
		ifTrue: [ (cache
				typAt: {#type.
						aMethod methodClass}) remove: aMethod ifAbsent: [  "noop" ] ]
]

{ #category : #accessing }
TypShaIndex >> resolveMethod: aLookup [
	^ cache
		typAt: {#method.
				aLookup receiver classDescription.
				aLookup selector}
		ifPresent: [ :s | s collect: [ :m | nil withArgs: {aLookup} executeMethod: m ] ]
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypShaIndex >> resolveType: aLookup [
	^ cache
		typAt: {#type.
				aLookup classDescription class}
		ifPresent: [ :s | s collect: [ :m | nil withArgs: {aLookup} executeMethod: m ] ]
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypShaIndex >> resolveVariable: aLookup [
	^ cache
		typAt: {#variable.
				aLookup receiver classDescription.
				aLookup selector}
		ifPresent: [ :s | s collect: [ :m | nil withArgs: {aLookup} executeMethod: m ] ]
		ifAbsent: [ #() ]
]
