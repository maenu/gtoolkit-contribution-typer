Class {
	#name : #TypTypeLookup,
	#superclass : #TypLookup,
	#instVars : [
		'classDescription'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypTypeLookup class >> classDescription: aClassDescription [
	^ self index
		typAt: {aClassDescription}
		ifAbsentPut: [ self new
				initializeClassDescription: aClassDescription;
				yourself ]
]

{ #category : #accessing }
TypTypeLookup class >> resolver [
	^ resolver
		ifNil: [ resolver := TypBreadthFirstResolver
					resolvers: {TypDepthFirstResolver resolver: TypPraTypeResolver new.
							TypDepthFirstResolver resolver: TypShaTypeResolver new.
							TypDepthFirstResolver resolver: TypInfTypeResolver new} ]
]

{ #category : #comparing }
TypTypeLookup >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	^ classDescription = anObject classDescription
]

{ #category : #copying }
TypTypeLookup >> asParent [
	self assert: [ self hasParent ].
	^ self class classDescription: classDescription superclass
]

{ #category : #accessing }
TypTypeLookup >> classDescription [
	<typPraResult: 'ClassDescription'>
	^ classDescription
]

{ #category : #invalidation }
TypTypeLookup >> dependsOnClassDescription: aClassDescription [
	(super dependsOnClassDescription: aClassDescription) ifTrue: [ ^ true ].
	^ classDescription = aClassDescription
		or: [ classDescription inheritsFrom: aClassDescription ]
]

{ #category : #testing }
TypTypeLookup >> hasParent [
	^ classDescription superclass isNotNil
		and: [ classDescription superclass ~= classDescription
				and: [ (classDescription superclass inheritsFrom: classDescription) not ] ]
]

{ #category : #comparing }
TypTypeLookup >> hash [
	^ classDescription hash
]

{ #category : #initialization }
TypTypeLookup >> initialize [
	<typPraVariable: 'classDescription' as: 'ClassDescription'>
	super initialize
]

{ #category : #accessing }
TypTypeLookup >> initializeClassDescription: anObject [
	<typPraArguments: 'ClassDescription'>
	classDescription := anObject
]

{ #category : #accessing }
TypTypeLookup >> printOn: aStream [
	aStream nextPutAll: classDescription name.
	super printOn: aStream
]
