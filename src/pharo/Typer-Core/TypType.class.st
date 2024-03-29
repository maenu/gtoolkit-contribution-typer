Class {
	#name : #TypType,
	#superclass : #Object,
	#instVars : [
		'superType',
		'hash'
	],
	#classInstVars : [
		'index'
	],
	#category : #'Typer-Core-Core'
}

{ #category : #accessing }
TypType class >> index [
	^ index ifNil: [ index := IdentityDictionary new ]
]

{ #category : #invalidation }
TypType class >> invalidate [
	<script>
	index := nil
]

{ #category : #invalidation }
TypType class >> invalidateAll [
	<script>
	self withAllSubclassesDo: #invalidate
]

{ #category : #comparing }
TypType >> < aType [
	<typPraResult: 'Boolean'>
	<typPraArguments: 'TypType'>
	^ aType > self
]

{ #category : #comparing }
TypType >> <= aType [
	<typPraResult: 'Boolean'>
	<typPraArguments: 'TypType'>
	^ aType >= self
]

{ #category : #comparing }
TypType >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	anObject hasSuper = self hasSuper ifFalse: [ ^ false ].
	self hasSuper ifFalse: [ ^ true ].
	anObject hash = self hash ifFalse: [ ^ false ].
	^ self super = anObject super
]

{ #category : #comparing }
TypType >> > aType [
	<typPraResult: 'Boolean'>
	<typPraArguments: 'TypType'>
	aType = self
		ifTrue: [ ^ false ].
	aType hasSuper
		ifFalse: [ ^ false ].
	^ self >= aType super
]

{ #category : #comparing }
TypType >> >= aType [
	<typPraResult: 'Boolean'>
	<typPraArguments: 'TypType'>
	^ self > aType or: [ self = aType ]
]

{ #category : #accessing }
TypType >> allSelectors [
	"needed by gt completion, compromise compatibility"

	self subclassResponsibility
]

{ #category : #compatibility }
TypType >> arguments [

	self hasSuper ifFalse: [ ^ #(  ) ].
	^ self super arguments
]

{ #category : #converting }
TypType >> asNonNullable [

	^ self
]

{ #category : #converting }
TypType >> asNullable [

	^ { 
		  TypNilType instance.
		  self } typAsType
]

{ #category : #compatibility }
TypType >> at: aString [

	self hasSuper ifFalse: [ ^ TypUnknownType instance ].
	^ self super at: aString
]

{ #category : #compatibility }
TypType >> boundTo: aType [

	"noop"

	^ self
]

{ #category : #lookup }
TypType >> canLookupMethod: aSymbol [
	^ self canLookupMethod: aSymbol arguments: aSymbol typInfUnknownArguments
]

{ #category : #lookup }
TypType >> canLookupMethod: aSymbol arguments: aCollection [
	^ (TypMethodLookup
		receiver: self
		selector: aSymbol
		arguments: aCollection) canResolve
]

{ #category : #lookup }
TypType >> canLookupVariable: aSymbol [
	^ (TypVariableLookup receiver: self selector: aSymbol) canResolve
]

{ #category : #converting }
TypType >> contravariant: aType [
	"self and aType are assignable to result.
	 result >= self
	 result >= aType
	 should be valid
	
	 name is not precise"

	| a b i common |
	aType isUnknown ifTrue: [ ^ aType ].
	aType isNil ifTrue: [ ^ self asNullable ].
	self >= aType ifTrue: [ ^ self ].
	self < aType ifTrue: [ ^ aType ].
	a := self withAllSupers reversed.
	b := aType withAllSupers reversed.
	a size > b size
		ifTrue: [  "ensure a to be shorter than b"| tmp |
			tmp := a.
			a := b.
			b := tmp ].
	a first ~= b first
		ifTrue: [ ^ {self.
				aType} typAsType ].
	common := a first.
	i := 2.
	[ i <= a size and: [ (a at: i) = (b at: i) ] ]
		whileTrue: [ common := a at: i.
			i := i + 1 ].
	^ common
]

{ #category : #converting }
TypType >> covariant: aType [
	"result is assignable to self and aType.
	 self >= result
	 aType >= result
	 should be valid"

	aType == self ifTrue: [ ^ self ].
	aType isUnknown ifTrue: [ ^ self ].
	aType isNil ifTrue: [ ^ self asNullable ].
	self >= aType ifTrue: [ ^ aType ].
	self < aType ifTrue: [ ^ self ].
	^ {self.
		aType} typAsMinimizedType
]

{ #category : #accessing }
TypType >> dependsOnClassDescription: aClassDescription [
	^ false
]

{ #category : #accessing }
TypType >> dependsOnCompiledMethod: aCompiledMethod [
	^ false
]

{ #category : #accessing }
TypType >> hasNode [
	^ false
]

{ #category : #testing }
TypType >> hasSuper [
	^ superType isNotNil
]

{ #category : #comparing }
TypType >> hash [

	^ hash ifNil: [ hash := self hashSkipping: IdentitySet new ]
]

{ #category : #comparing }
TypType >> hashSkipping: anIdentitySet [

	<typPraArguments: 'IdentitySet<TypType>'>
	<typPraResult: 'Integer'>
	(anIdentitySet includes: self) ifTrue: [ ^ 23 ].
	anIdentitySet add: self.
	superType ifNil: [ ^ 23 ].
	^ 23 bitXor: (superType hashSkipping: anIdentitySet)
]

{ #category : #initialization }
TypType >> initialize [

	<typPraVariable: 'superType' as: '{!,TypType}'>
	self flag: 'TODO use class-side methods for typings, empty initialize is intrusive'.
	super initialize
]

{ #category : #initialization }
TypType >> initializeSuper: aType [
	aType = superType ifTrue: [ ^ self ].
	superType := aType.
	hash := nil
]

{ #category : #accessing }
TypType >> isBound [
	^ true
]

{ #category : #testing }
TypType >> isFunction [
	<typPraResult: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isNamed [
	<typPraResult: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isNil [
	<typPraResult: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isNullable [
	^ self isNil
]

{ #category : #testing }
TypType >> isParametric [
	<typPraResult: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isSuper [

	^ false
]

{ #category : #testing }
TypType >> isUnion [
	<typPraResult: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isUnknown [
	<typPraResult: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isValue [

	^ false
]

{ #category : #testing }
TypType >> isVariable [
	<typPraResult: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isVoid [
	<typPraResult: 'Boolean'>
	^ false
]

{ #category : #lookup }
TypType >> lookupMethod: aSymbol [
	^ self lookupMethod: aSymbol arguments: aSymbol typInfUnknownArguments
]

{ #category : #lookup }
TypType >> lookupMethod: aSymbol arguments: aCollection [
	^ (TypMethodLookup
		receiver: self
		selector: aSymbol
		arguments: aCollection) resultOrUnknown
]

{ #category : #lookup }
TypType >> lookupVariable: aSymbol [
	^ (TypVariableLookup receiver: self selector: aSymbol) resultOrUnknown
]

{ #category : #compatibility }
TypType >> parameters [

	self hasSuper ifFalse: [ ^ #(  ) ].
	^ self super parameters
]

{ #category : #'as yet unclassified' }
TypType >> printNameOn: aStream skipping: anIdentitySet [
	"trickery for parameter-less string"

	self printOn: aStream skipping: anIdentitySet
]

{ #category : #printing }
TypType >> printOn: aStream [
	self printOn: aStream skipping: IdentitySet new
]

{ #category : #printing }
TypType >> printOn: aStream skipping: anIdentitySet [
	self subclassResponsibility
]

{ #category : #compatibility }
TypType >> result [

	self hasSuper ifFalse: [ ^ TypUnknownType instance ].
	^ self super result
]

{ #category : #compatibility }
TypType >> signalsAlways [
	^ nil
]

{ #category : #compatibility }
TypType >> signalsMaybe [
	^ nil
]

{ #category : #accessing }
TypType >> super [

	<typPraResult: 'TypType'>
	self assert: [ self hasSuper ].
	^ superType "typCastAs TypType"
]

{ #category : #'as yet unclassified' }
TypType >> superOrNil [
	self hasSuper ifFalse: [ ^ nil ].
	^ self super
]

{ #category : #compatibility }
TypType >> types [
	^ {self} asIdentitySet
]

{ #category : #'as yet unclassified' }
TypType >> withAllSupers [
	self hasSuper ifFalse: [ ^ {self} ].
	^ {self} , self super withAllSupers
]

{ #category : #converting }
TypType >> withAt: aString put: aType [

	^ self withSuper: (self super withAt: aString put: aType)
]

{ #category : #converting }
TypType >> withParameters: aCollection [
	self hasSuper ifFalse: [ ^ self ].
	^ self withSuper: (self super withParameters: aCollection)
]

{ #category : #converting }
TypType >> withSuper: aType [

	self subclassResponsibility
]
