Class {
	#name : #TypShaGtGtMethodsCoder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #shadow }
TypShaGtGtMethodsCoder class >> mForMethods: aLookup [
	<typShaMethod: 'forMethods:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {(Collection typAsType copyWithParameters: {CompiledMethod typAsType})}
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
