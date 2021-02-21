Class {
	#name : #TypShaGtGtMethodsCoder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #accessing }
TypShaGtGtMethodsCoder class >> ___forMethods: _a [
	^ TypFunctionType new
		argumentTypes:
				[ :i :a :s :r | Collection typAsType copyWithParameters: {CompiledMethod typAsType} ];
		resultType: [ :a :s :r | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodsCoder class >> shadowedClass [
	^ GtMethodsCoder class
]

{ #category : #accessing }
TypShaGtGtMethodsCoder >> ___announce: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Announcement typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
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
