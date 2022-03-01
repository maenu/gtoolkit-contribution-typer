Class {
	#name : #TypType,
	#superclass : #TypNode,
	#instVars : [
		'superType',
		'hash'
	],
	#classInstVars : [
		'index'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #initialization }
TypType class >> initialize [

	index := WeakValueDictionary new
]

{ #category : #invalidation }
TypType class >> invalidate [

	<script>
	index removeAll
]

{ #category : #invalidation }
TypType class >> invalidateAll [

	<script>
	self invalidate.
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

{ #category : #converting }
TypType >> asCompatibleWith: aType [

	<typPraResult: 'TypType'>
	<typPraArguments: 'TypType'>
	<typEdge>
	^ aType isVariable
		  ifTrue: [ aType ]
		  ifFalse: [ 
			  aType isUnknown
				  ifTrue: [ aType ]
				  ifFalse: [ 
					  aType isNil
						  ifTrue: [ self asNullable ]
						  ifFalse: [ 
							  self >= aType
								  ifTrue: [ self ]
								  ifFalse: [ 
									  self hasSuper
										  ifTrue: [ self super asCompatibleWith: aType ]
										  ifFalse: [ TypUnknownType instance ] ] ] ] ]
]

{ #category : #converting }
TypType >> asNonNullable [

	^ self
]

{ #category : #converting }
TypType >> asNullable [

	<typEdge>
	^ { 
		  TypNilType instance.
		  self } typAsType
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
	self hasSuper ifFalse: [ ^ 23 ].
	^ 23 bitXor: (self super hashSkipping: anIdentitySet)
]

{ #category : #initialization }
TypType >> initialize [

	<typPraVariable: 'superType' as: '{!,TypType}'>
	super initialize.
	hash := nil
]

{ #category : #initialization }
TypType >> initializeSuperType: aType [

	aType = superType ifTrue: [ ^ self ].
	superType ifNotNil: [ self outgoingRemoveAt: #super ].
	superType := aType.
	superType ifNotNil: [ self outgoingAt: #super put: superType ].
	hash := nil
]

{ #category : #invalidation }
TypType >> invalidateOnClassChange: aClassAnnouncement [

	^ false
]

{ #category : #invalidation }
TypType >> invalidateOnMethodChange: aMethodAnnouncement [

	^ false
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

{ #category : #lookup }
TypType >> lookupMethod: aSymbol [

	| arguments |
	arguments := aSymbol numArgs typTimesCollect: [ :e | 
		             TypUnknownType instance ].
	^ self lookupMethod: aSymbol arguments: arguments
]

{ #category : #lookup }
TypType >> lookupMethod: aSymbol arguments: aCollection [

	^ TypMethodIndex instance
		  lookupMethodReceiver: self
		  selector: aSymbol
		  arguments: aCollection
]

{ #category : #lookup }
TypType >> lookupVariable: aSymbol [

	^ TypVariableIndex instance lookupReceiver: self selector: aSymbol
]

{ #category : #printing }
TypType >> printOn: aStream [
	self printOn: aStream skipping: IdentitySet new
]

{ #category : #printing }
TypType >> printOn: aStream skipping: anIdentitySet [

	self subclassResponsibility
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

{ #category : #converting }
TypType >> withSuper: aType [

	<typEdge>
	self flag: 'TODO should use index lookup, not copy'.  
	^ self copy
		  initializeSuperType: aType;
		  yourself
]
