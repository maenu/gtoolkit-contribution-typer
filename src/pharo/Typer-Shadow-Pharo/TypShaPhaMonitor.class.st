Class {
	#name : #TypShaPhaMonitor,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaMonitor class >> shadowedClass [
	^ Monitor class
]

{ #category : #accessing }
TypShaPhaMonitor >> ___critical: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure typAsType
				asFunctionType: {}
				result: TypUnknownType instance
				optionalParameters: false ];
		resultType: [ :a :s :r | (a argumentTypes at: 1) result ];
		yourself
]
