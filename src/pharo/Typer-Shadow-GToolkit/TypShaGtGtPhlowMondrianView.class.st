Class {
	#name : #TypShaGtGtPhlowMondrianView,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPhlowMondrianView class >> shadowedClass [
	^ GtPhlowMondrianView class
]

{ #category : #accessing }
TypShaGtGtPhlowMondrianView >> ___painting: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure typAsType
				asFunctionType: {GtMondrian typAsType}
				result: TypUnknownType instance
				optionalParameters: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
