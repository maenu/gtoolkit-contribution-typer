Class {
	#name : #TypTypeScanner,
	#superclass : #SmaCCScanner,
	#category : #'Typer-Parser'
}

{ #category : #'generated-initialization' }
TypTypeScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(10 'nil' 9))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
TypTypeScanner >> emptySymbolTokenId [
	^ 17
]

{ #category : #generated }
TypTypeScanner >> errorTokenId [
	^ 18
]

{ #category : #generated }
TypTypeScanner >> scanForToken [
	self step.
	currentCharacter == $!
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	^ self scanForTokenX3
]

{ #category : #generated }
TypTypeScanner >> scanForTokenX1 [
	[ self recordMatch: #(10).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue
]

{ #category : #generated }
TypTypeScanner >> scanForTokenX2 [
	self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	^ self reportLastMatch
]

{ #category : #generated }
TypTypeScanner >> scanForTokenX3 [
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter == $<
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(6 10) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue:
			[ self scanForTokenX1 ].
	^ self reportLastMatch
]
