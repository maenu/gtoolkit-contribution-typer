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
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments: {GtMondrian typAsType}
				result: TypUnknownType new
				argumentsOptional: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
