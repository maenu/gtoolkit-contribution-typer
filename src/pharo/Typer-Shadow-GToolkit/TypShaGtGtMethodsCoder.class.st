Class {
	#name : #TypShaGtGtMethodsCoder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #shadow }
TypShaGtGtMethodsCoder class >> mForMethods: aLookup [
	<typShaMethod: 'forMethods:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments:
			{(Collection typAsType copyWithParameters: {CompiledMethod typAsType})}
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodsCoder class >> shadowedClass [
	^ GtMethodsCoder class
]

{ #category : #shadow }
TypShaGtGtMethodsCoder >> mAnnounce: aLookup [
	<typShaMethod: 'announce:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {Announcement typAsType}
]

{ #category : #accessing }
TypShaGtGtMethodsCoder >> vMethodCoders: aLookup [
	<typShaVariable: #methodCoders>
	^ SequenceableCollection typAsType
		copyWithParameters: {GtPharoMethodCoder typAsType}
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodsCoder >> vMethods: aLookup [
	<typShaVariable: #methods>
	^ SequenceableCollection typAsType
		copyWithParameters: {CompiledMethod typAsType}
]
