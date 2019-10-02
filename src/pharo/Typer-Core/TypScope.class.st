Class {
	#name : #TypScope,
	#superclass : #Object,
	#instVars : [
		'parent',
		'mappings'
	],
	#category : #'Typer-Core'
}

{ #category : #operations }
TypScope >> adopt: aScope [
	aScope keysAndValuesDo: [ :n :v | self at: n put: v ]
]

{ #category : #'instance creation' }
TypScope >> at: aString [
	^ mappings
		at: aString
		ifAbsent: [ parent
				ifNil: [ TypUnknownType instance ]
				ifNotNil: [ parent at: aString ] ]
]

{ #category : #'instance creation' }
TypScope >> at: aString put: aType [
	^ mappings at: aString put: aType
]

{ #category : #initialization }
TypScope >> initialize [
	super initialize.
	mappings := Dictionary new
]

{ #category : #operations }
TypScope >> keysAndValuesDo: aBlock [
	^ mappings keysAndValuesDo: aBlock
]

{ #category : #accessing }
TypScope >> parent [
	^ parent ifNil: [ parent := self class new ]
]

{ #category : #accessing }
TypScope >> parent: aScope [
	self assert: [ parent isNil ].
	parent := aScope
]

{ #category : #copying }
TypScope >> postCopy [
	super postCopy.
	parent ifNotNil: [ parent := parent copy ].
	mappings := mappings copy
]
