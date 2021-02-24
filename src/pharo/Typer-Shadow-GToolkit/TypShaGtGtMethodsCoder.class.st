Class {
	#name : #TypShaGtGtMethodsCoder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #shadow }
TypShaGtGtMethodsCoder class >> mForMethods: aLookup [ 
	<typShaMethod: 'forMethods:'>
	
	^ TypFunctionType new
		argumentTypes:
				[ :i :a :s :r | Collection typAsType copyWithParameters: {CompiledMethod typAsType} ];
		resultType: [ :a :s :r | a receiver classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodsCoder class >> shadowedClass [
	^ GtMethodsCoder class
]

{ #category : #shadow }
TypShaGtGtMethodsCoder >> mAnnounce: aLookup [
	<typShaMethod: 'announce:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {Announcement typAsType}
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodsCoder >> vMethodCoders: aLookup [
	<typShaForVariable: #methodCoders>
	^ SequenceableCollection typAsType
		copyWithParameters: {GtMethodCoder typAsType}
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodsCoder >> vMethods: aLookup [
	<typShaForVariable: #methods>
	^ SequenceableCollection typAsType
		copyWithParameters: {CompiledMethod typAsType}
]
